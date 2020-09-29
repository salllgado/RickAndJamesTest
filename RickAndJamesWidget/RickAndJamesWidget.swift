//
//  RickAndJamesWidget.swift
//  RickAndJamesWidget
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import WidgetKit
import SwiftUI

struct RickAndJamesWidgetEntryView : View {
    var entry: CharacterProvider.Entry
    
    init(entry: CharacterProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            Image(uiImage: getImage())
                .resizable()
            VStack(alignment: .leading, spacing: 0, content: {
                Spacer()
                Text(entry.character.name)
                    .bold()
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text(entry.character.status)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                    Spacer()
                }
            })
            .background(Color.black.opacity(0.2))
            .cornerRadius(8)
            .frame(width: .infinity, height: 0, alignment: .topLeading)
            .padding(8)
        })
        .background(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
    }
    
    func getImage() -> UIImage {
        let imageView = UIImageView()
        imageView.cacheImage(urlString: entry.character.image, defaultImage: UIImage(named: "WidgetBackground")!)
        
        return imageView.image!
    }
}

@main
struct RickAndJamesWidget: Widget {
    let kind: String = "RickAndJamesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CharacterProvider()) { entry in
            RickAndJamesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct RickAndJamesWidget_Previews: PreviewProvider {
    static var previews: some View {
        let fakeCharacter = CharacterResult(id: 1, name: "Some name", status: "Alive", species: "Human", gender: "Male", image: "none", location: CharacterLocationResult(name: "Earth"))
        RickAndJamesWidgetEntryView(entry: CharacterEntry(date: Date(), character: fakeCharacter))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
