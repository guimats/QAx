from robot.api.deco import keyword
from pymongo import MongoClient

cliente = MongoClient('mongodb+srv://qa:xperience@cluster0.7t92z.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = cliente['markdb']

@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print(f'removing user by {email}')