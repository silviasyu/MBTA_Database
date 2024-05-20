import pymysql

def setup():
    """ This function takes no input parameters. It connects the front end to the database by prompting
        the user for their MySQL Workbench credentials.
    """
    username = input("Enter your MySQL username: ")
    password = input("Enter your MySQL password: ")
    
    global mydb
    mydb = pymysql.connect (
        host="localhost",
        user= username, 
        password= password, 
        database="mbtadb",
        cursorclass= pymysql.cursors.DictCursor,
        autocommit=True
    )

    global cursor
    cursor = mydb.cursor()



def input_validation(my_list, input_prompt):
    """ This function takes in a list and a input prompt as parameters and prompts the user for an input if input value is in the 
        list it returns a success message otherwise it returns False and keeps prompting the user to pick a valid aswer.
    """

    print(input_prompt)
    for item in my_list:
        print("   ", item)
    answer = input("user input: ")
    print("\n")
    
    while answer not in my_list:
        print("Invalid input, please answer the question again.")
        answer = input("user input: ")
        print("\n")

    return answer


def transform_to_list(list_of_dict, name):
    ''' This is a helper functon that takes in list of dictionaries and a name of value in the dictionary 
        iterates through the list and creates the list of items that map to the name parameter.
    '''
    return_list = []
    for items in list_of_dict:
        return_list.append(items[name])
    return return_list


def user_function():
    ''' This function takes care of all the user interaction associated with a user of the MBTA station'''
    cursor.callproc("all_lines")
    line_options = [line for line in cursor.fetchall()]
    line_list = transform_to_list(line_options, "line_name")
    initial = input_validation(["line", "station"], "Please choose one of the following to search: ")
    if initial == "line":
        line = input_validation(line_list, "Pick a line from the following options: ")
        list_of_line_queries = ["Charlie card", "accessible", "all stations", "descriptions", "Quit"]
        prompt_line = "What would you like to query from? "
        line_answer = input_validation(list_of_line_queries,  prompt_line)
        while line_answer != "Quit":
            if line_answer == "Charlie card":
                cursor.callproc("new_card_from_line", [line])
                stations_new_cards  = [station for station in cursor.fetchall()]
                stations_new_cards_list = transform_to_list(stations_new_cards, "station_name")
                print("These are all the stations where you can get a new Charile card: ")
                for stations in stations_new_cards_list:
                    print("   ", stations)
                print("\n")
     
            elif line_answer == "accessible":
                cursor.callproc("accessible_from_line", [line])
                stations_accessible  = [station for station in cursor.fetchall()]
                stations_accessible_list = transform_to_list(stations_accessible, "station_name")
                print("These are all the stations that are accessible: ")
                for stations in stations_accessible_list:
                    print("   ", stations)
                print("\n")

            
            elif line_answer == "all stations":
                cursor.callproc("all_stations_of", [line])
                stations_of_line  = [station for station in cursor.fetchall()]
                stations_of_line_list = transform_to_list(stations_of_line, "station_name")
                print("These are all the stations of the " + line + " line: ")
                for stations in stations_of_line_list:
                    print("   ", stations)
                print("\n")

            elif line_answer == "descriptions":
                show_all_user_ops_line()


            prompt_line = "Would you like to query anything else about this line?"
            line_answer = input_validation(list_of_line_queries,  prompt_line)
        
            
    else:
        line = input_validation(line_list, "Pick the line that the station you want to query is on.")
        cursor.callproc("all_stations_of", [line])
        stations_of_line  = [station for station in cursor.fetchall()]
        list_curr_stations = transform_to_list(stations_of_line, "station_name")
        chosen_station = input_validation(list_curr_stations, "pick a station")
        list_of_station_queries = ["arrival times", "next train", "which lines", "descriptions", "Quit"]
        station_answer = input_validation(list_of_station_queries, "what would you like to query regarding this station? ")
        while station_answer != "Quit":
            if station_answer == "arrival times":
                cursor.callproc("all_times_for_station", [chosen_station])
                arrival_times  = [times for times in cursor.fetchall()]
                arrival_times_list = transform_to_list(arrival_times, "arrival_time")
                print("these are arrival times in this station")
                for time in arrival_times_list:
                    print("   ", time)
                print("\n")

            elif station_answer == "next train":
                current_time = input("input time:")
                cursor.callproc("next_train_after_time",[current_time, chosen_station])
                next_times  = [times for times in cursor.fetchall()]
                next_times_list = transform_to_list(next_times, "arrival_time")
                print("next train arrives at")
                for time in next_times_list:
                    print("   ", time)
                print("\n")

            elif station_answer == "which lines":
                cursor.callproc("lines_of_station", [chosen_station])
                lines_of_station  = [lines for lines in cursor.fetchall()]
                lines_of_station_list = transform_to_list(lines_of_station, "line_name")
                print("This station is served by: ")
                for line in lines_of_station_list:
                    print("   ", line)
                print("\n")

            elif station_answer == "descriptions":
                show_all_user_ops_station()
            station_answer = input_validation(list_of_station_queries, "What would you like to query regarding this station? ")
        
def show_all_user_ops_line ():
    """ This function prints out the descriptions of all the user options when searching by line. 
    """
    print("The following is a description of the user options when searching by line: \n" +
        "    Charlie card - Shows stations on that line where a rider can get a new Charile card from a service agent.\n" +
        "    accessible - Shows stations on that line that are accessible.\n" + 
        "    all stations - Shows and returns all the stations on that line. \n" 
        )
    
def show_all_user_ops_station ():
    """ This function prints out the descriptions of all the user options when searching by station. 
    """
    print("The following is a description of the user options when searching by station: \n" +
        "    arrival times - Shows all the arrival times for that station. \n" + 
        "    next train - Given a time (in the form of 24:00:00) show the arrival times after that time for that station)\n" + 
        "    which lines - Show all of the lines that station is a part of. \n" 
        )



def show_all_admin_ops ():
    """ This function prints out all the entities that can be modified in this database and their respective allowed operations and descriptions of them. 
    """
    
    # this includes operations that were not implemented in this user application code for admins:
    # print("Here entity and their respective allowed operations - and a description of the operation:" +
    #     "    create admin - Given password, first name, last name,  phone number and email, add this employee as a new admin to this database \n" +
    #     "    delete admin - Given an existing admin's employee ID, delete that admin from this database \n" + 
    #     "    update admin phone number - Given an existing admin's employee ID and their new phone number, change the phone" + 
    #     " number associated with this employee to the new one\n" + 
    #     "    update admin email - Given an existing admin's employee ID and their new email, change the email associated with this employee to the new one\n" + 
    #     "    create train - Given a train's ID, capacity, and the name/color of the line associated with it, add this new train to this database\n" + 
    #     "    delete train - Given an existing train's ID, delete that train from this database \n" + 
    #     "    update train capacity - Given an existing train's ID and new capacity, change the capacity associated with this train to the new one \n" + 
    #     "    create scheduled_time - Given an arrival time not in the database, add it\n" + 
    #     "    delete scheduled_time - Given an exisiting arrival time, delete it from the database\n" +
    #     "    update station name - Given an existing station's current name and new name, change it's name from the current to the new one\n" +
    #     "    update station for new Charlie card - Given an existing station's name and either yes or no, change the station to one that has serivce agent that give out new Charile" +
    #     " cards or not repectively\n" +
    #     "    update station for accessibility- Given an existing station's name and either yes or no, change the station to one that's accesessible or not respectively\n" +
    #     "    create arrives - Given an existing station's name, an existing train ID, and an existing arrival time, add this arrives relationship to thie database\n" )
    
    # this includes only the operations implemented in this user application code for admins:
    print("Here entity and their respective allowed operations - and a description of the operation: \n" +
        "    create admin - Given a password, first name, last name,  phone number and email, add this employee as a new admin to this database \n" +
        "    delete admin - Given an existing admin's employee ID, delete that admin from this database \n" + 
        "    update admin email - Given an existing admin's employee ID and their new email, change the email associated with this employee to the new one\n" + 
        "    create train - Given a train's ID, capacity, and the name/color of the line associated with it, add this new train to this database\n" + 
        "    delete train - Given an existing train's ID, delete that train from this database \n" + 
        "    update train capacity - Given an existing train's ID and new capacity, change the capacity associated with this train to the new one \n")


"""
    Modifying the admin entity 
"""
def printing_admin():
    admin_list = []
    cursor.callproc("get_all_admins")
    admin_get_list = [admin for admin in cursor.fetchall()]
    admin_list.append("id    first_name last_name        email")
    for i in range(len(admin_get_list)):
        admin_list.append(str(admin_get_list[i]["admin_id"]) + "     " + admin_get_list[i]["first_name"] + " " + admin_get_list[i]["last_name"] 
        + "            " + admin_get_list[i]["email"])
    for admin in admin_list:
        print("   ", admin)


def create_admin():
    #display the list of admins before the new admin is added to the system:
    print("this is what the admin list looks like before:")
    printing_admin()

    new_password = input("Provide new password: ")
    new_first_name = input("Provide a first name: ")
    new_last_name  = input ("Provide a last Name: ")
    new_phone = input("Provide a phone number: ")
    new_email = input("Provide an email: ")
    cursor.callproc("create_new_admin", [new_password, new_first_name, new_last_name, new_phone, new_email])

    #display the list of admins after the new admin is added to the system:    
    print("This is what the admin list looks like after creating a new admin: ")
    printing_admin()

    
def delete_admin():
    #display the list of admins before an admin is deleted from the system:
    print("This is what the admin list looks like before modifications:")
    printing_admin()
    
    delete_id = int(input("\nProvide the ID of the admin which you would like to delete: "))
    cursor.callproc("delete_admin", [delete_id])

    #display the list of admins after an admin is deleted from the system:
    print("\nThis is what the admin list looks like after the admin with ID ", delete_id ," was deleted: ")
    printing_admin()



def update_email_admin():
    #display the list of admins before the admin's emain is update:
    print("This is what the admin list looks like before modifications:")
    printing_admin()
    
    update_admin = int(input("\nProvide id of the admin whose email you would like to update. \nuser input: "))
    new_email = input("\nProvide new email. \nuser input: ")
    cursor.callproc("update_email_admin", [update_admin,new_email])

    #display the list of admins after the admin's email is updated:
    print("\nThis is what the admin list looks like after updating an email: ")
    printing_admin()


"""
    Modifying the train entity 
"""
def train_printing():
    cursor.callproc("get_all_trains")
    train_get_all_list = [train for train in cursor.fetchall()]
    train_list = []
    train_list.append("train_id   capacity   line_name")
    for i in range(len(train_get_all_list)):
        train_list.append(str(train_get_all_list[i]["train_id"])+"         " + str(train_get_all_list[i]["capacity"])
                + "        " + train_get_all_list[i]["line_name"]) 
    for train in train_list:
        print("   ", train)
    

def create_train():
    #display the list of trains before a new train is added to the system
    print("This is what the trains list looks like before modifications: ")
    train_printing()

    new_id = int(input("\nProvide id of the train you would like to create. "))
    new_capacity = int(input("\nWhat is the capacity of this new train?  "))
    new_line = input("\nWhich line do you want to add it to? ")
    cursor.callproc("create_new_train", [new_id,new_capacity, new_line])

    # #display list of trains after the new train has been added to the system
    print("\nThis is what the trains list looks like after new train was created: ")
    train_printing()

    
def update_train_capacity():
    #display the list of trains before modifications: 
    print("This is what the trains list looks like before modifications: ")
    train_printing()

    id = int(input("\nWhich train from the above would you like to update? Please give the train id: "))
    new_capacity = int(input("\nwhat is the capacity of a new train?  "))
    cursor.callproc("update_train_capacity", [id,new_capacity])

    #display list of trains after updating the capacity of a train
    print("\nThis is what the trains list looks like after train ", id, " was updated: ")
    train_printing()

    
def delete_train():
    #display the list of trains before train is deleted
    print("This is what the trains list looks like before modifications: ")
    train_printing()
    
    id = int(input("\nWhich train from the above would you like to delete? Please give the train id: "))
    cursor.callproc("delete_train", [id])

    #display list of trains after a train has been deleted 
    print("\nThis is what the train list looks like after train ", id, " was deleted: ")
    train_printing()


# future work: 
# def create_scheduled_time():
#     pass
# def delete_scheduled_time():
#     pass
# def update_scheduled_time():
#     pass



def admin():
    """ This function function takes care of the user interations associated with the admin. All the CRUD opertations. 
    """
    # for future works: implementent functionalities that we have procedure for.
    # admin_operations_list = ["create admin", "delete admin", "update admin phone number", "update admin email", "create train", "delete train", "update train capacity", 
    #                          "create scheduled_time", "delete scheduled_time", "update station name", "update station for new Charlie card", "update station for accessibility",
    #                          "create arrives", "show description of operations", "Quit"]
    # admin_op_message = "Please choose one of the above - operation pair to modify the database  "
    # admin_op = input_validation(["create admin", "delete admin", "update admin phone number", "update admin email", "create train", "delete train", "update train capacity", 
    #                          "create scheduled_time", "delete scheduled_time", "update station name", "update station for new Charlie card", "update station for accessibility",
    #                          "create arrives", "show description of operations", "Quit"], admin_op_message)

    admin_operations_list = ["create admin", "delete admin", "update admin email", "create train", "delete train", "update train capacity", 
                             "descriptions", "Quit"]

    admin_op_message = "Please choose one of the following operations:  "
    admin_op = input_validation(["create admin", "delete admin", "update admin email", "create train", "delete train", "update train capacity", 
                             "descriptions", "Quit"], admin_op_message)
    
    while admin_op != "Quit":
        if admin_op == "create admin":
            create_admin()
        elif admin_op == "delete admin":
            delete_admin()
        elif admin_op == "update admin email":
            update_email_admin()
        elif admin_op == "create train":
            create_train()
        elif admin_op == "delete train":
            delete_train()
        elif admin_op == "update train capacity":
            update_train_capacity()
        elif admin_op == "descriptions":
            show_all_admin_ops()
        
        prompt = "\nWould you like to modify anything else? "
        admin_op = input_validation(admin_operations_list, prompt)
        

def user_or_admin():
    """This function prompts user to choose it's role: user or admin. If the role selected is user, 
    then the user function will be called else the admin function will be called."""
    answer = input_validation(["user", "admin"], "Please choose one of the following: ")
    if answer == "user":
        user_function()

    elif answer == "admin":
        # admin sign in
        global admin_id_p
        admin_id_p = input("Please sign in. What is your admin_id: ")
        password_p = input("\nWhat is your password: ")
        cursor.callproc("check_password", [admin_id_p, password_p]) 
        check = [row for row in cursor.fetchall()]
        result = check[0]['count(*)']

        while result != 1:
            print("\nIncorrect password, please try again.\n")
            password_p = input("password: ")
            cursor.callproc("check_password", [admin_id_p, password_p])
            check = [row for row in cursor.fetchall()]
            result = check[0]['count(*)']
        
        print("\n")
        admin()



def main():
    """ This is the main function, the entry point of this program. It starts with trying to setup and connect to the 
    database. Then it prompts the users for their role."""
    try: 
        setup()
        user_or_admin()
    except pymysql.err.OperationalError as e1:
        print('Error: %d: %s' % (e1.args[0], e1.args[1]))
    finally:
        mydb.close()
    

if __name__ == "__main__":
    main()
