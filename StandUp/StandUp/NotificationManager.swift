import Foundation
import UserNotifications


class NotificationManager {


    static let shared = NotificationManager()


    private init() {}



    func requestPermission() {


        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .sound]
            ) { granted, error in


                if let error = error {

                    print(error)

                }


            }

    }




    func send(
        title: String,
        message: String
    ) {


        let content = UNMutableNotificationContent()


        content.title = title

        content.body = message

        content.sound = .default



        let request =
        UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: nil
        )


        UNUserNotificationCenter.current()
            .add(request)

    }


}
