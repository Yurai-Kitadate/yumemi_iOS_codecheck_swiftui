import Foundation
import SwiftUI

struct BookmarkRepositoryListCellView : View{
    var repository : Repository
    let screen: CGRect = UIScreen.main.bounds
    @State private var showingSheet = false
    var body : some View{
        
        
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .frame(height: screen.height/7)
                .onTapGesture {
                    self.showingSheet.toggle()
                    print(1)
                }
                .sheet(isPresented: $showingSheet) {
                    ScrollView{
                        RepositoryDetailView(repository: repository)
                    }
                }
            
            
            HStack{
                VStack{
                    Text(repository.full_name ?? "")
                    Text(repository.language ?? "")
                }
            }
            
        }.contextMenu
        {
            Button(action: { print("Action 1 triggered") }, label:
                    {
                Image(systemName: "delete.backward")
                    .foregroundColor(.red)
                Text("削除")
                    .foregroundColor(.red)
            })
            
            Button(action: {
                UIPasteboard.general.string = "https://github.com/" + (repository.full_name ?? "")
                
            }, label:
                    {
                Image(systemName: "doc.on.doc")
                Text("リンクをコピー")
            })
        }
        
    }
}
