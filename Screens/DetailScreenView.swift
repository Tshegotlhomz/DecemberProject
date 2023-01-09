

import SwiftUI

struct DetailScreenView: View {
    var body: some View {
        ZStack{
            Color(.darkGray)
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: Image(systemName: "chevron.backgrounds")
//                    .padding(.all, 12)
//                    .background(Color.white)
//                    .cornerRadius(3.0)
//                )

            VStack {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)

                DescriptionView()
                    .offset(y: -40)


            }
        }
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Angry World")
                .font(.title)
                .fontWeight(.bold)

            VStack(spacing: 4) {
                Text("slug description")
                    .opacity(0.5)
                    .padding(.leading, 8)

            }



            HStack {
                VStack(alignment: .leading) {
                    Text("Description")
                        .fontWeight(.medium)
                    .padding(.vertical, 5)

                    Text("gvdjvnkvvhdvhjkg,mvnbgsdeukg,vmcnbnxfhgjk,vbcvnzkmnbvnvgh")
                        .lineSpacing(6.0)
                        .opacity(0.6)
                        .padding(.vertical, 3)
                }
            }



//
            VStack (alignment: .leading) {
                    Text("Rating")
                        .fontWeight(.semibold)
                    Text("88.6")
                        .opacity(0.6)


                VStack {
                    Text("Age Rating Guide")
                        .fontWeight(.semibold)
                }
                    Text("17+(violence & profinity")
                        .opacity(0.6)

                }
        }
        .padding()
        .padding(.top)
        .background(Color(.darkGray))
        .cornerRadius(40.0)
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}
