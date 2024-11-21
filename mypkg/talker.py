import rclpy
from rclpy.node import Node
from person_msgs.srv import Query

rclpy.init()
node = Node("talker")


def cd(request, response):
    if request.name == "布村大和":
        response.age = 46
    else:
        response.age = 255

    return response


def main():
    srv = node.create_service(Query, "query", cd)
    rclpy.spin(node)
