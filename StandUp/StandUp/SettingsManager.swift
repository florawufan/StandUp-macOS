import Foundation



class SettingsManager: ObservableObject {



    @Published var workMinutes: Int {

        didSet {

            save()

        }

    }



    @Published var standMinutes: Int {

        didSet {

            save()

        }

    }






    private let workKey =
        "StandUp_WorkMinutes"



    private let standKey =
        "StandUp_StandMinutes"







    init() {


        let savedWork =
            UserDefaults.standard.object(
                forKey: workKey
            ) as? Int



        let savedStand =
            UserDefaults.standard.object(
                forKey: standKey
            ) as? Int






        self.workMinutes =
            savedWork ?? 50



        self.standMinutes =
            savedStand ?? 5


    }








    private func save() {


        UserDefaults.standard.set(
            workMinutes,
            forKey: workKey
        )



        UserDefaults.standard.set(
            standMinutes,
            forKey: standKey
        )


    }







    // 防止输入非法值

    func validate() {


        if workMinutes < 1 {

            workMinutes = 1

        }


        if workMinutes > 180 {

            workMinutes = 180

        }




        if standMinutes < 1 {

            standMinutes = 1

        }


        if standMinutes > 60 {

            standMinutes = 60

        }


    }


}
