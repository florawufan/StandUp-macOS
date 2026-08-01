import SwiftUI



struct SettingsView: View {


    @ObservedObject var settings: SettingsManager


    @Environment(\.dismiss)
    private var dismiss




    var body: some View {


        VStack(spacing: 16) {



            Text("")
                .font(.headline)




            HStack {


                Text("工作时间")


                Spacer()



                TextField(
                    "",
                    value: $settings.workMinutes,
                    format: .number
                )
                .frame(width: 50)



                Text("分钟")



            }






            HStack {


                Text("站立时间")


                Spacer()



                TextField(
                    "",
                    value: $settings.standMinutes,
                    format: .number
                )
                .frame(width: 50)



                Text("分钟")



            }






            Button("保存") {


                settings.validate()


                dismiss()


            }
            .keyboardShortcut(
                .defaultAction
            )




        }
        .padding(20)
        .frame(
            width: 220,
            height: 200
        )



    }


}
