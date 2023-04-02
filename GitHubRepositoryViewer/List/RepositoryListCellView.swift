import Foundation
import SwiftUI

struct RepositoryListCellView : View{
    var repository : Repository
    let screen: CGRect = UIScreen.main.bounds
    var body : some View{
        
        NavigationLink(destination: RepositoryDetailView()){
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(5)
                    .frame(width:screen.width/1.05,height: screen.height/7)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                HStack{
                    VStack{
                        Text(repository.full_name ?? "")
                        Text(repository.language ?? "")
                    }
                }
                
            }
        }
        
    }
}

