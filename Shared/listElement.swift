//
//  listElement.swift
//  kessingerCSC416_toDo
//
//  Created by Jacob on 3/19/22.
//

import SwiftUI

struct listElement: View {
    let msg: String
    @State var isFilled: Bool
    var image = "checkmark.circle"
    let defaults = UserDefaults.standard
    
    var body: some View {
        HStack {
            getImage(isFill: isFilled, fillKey: msg)
                .onTapGesture {
                    if (isFilled == true)
                    {
                        isFilled = false
                        defaults.set(false, forKey: msg)
                        
                    }
                    else
                    {
                        isFilled = true
                        defaults.set(true, forKey: msg)
                    }
                }
            Text(msg)
        }
    }
}

struct listElement_Previews: PreviewProvider {
    static var previews: some View {
        listElement(msg: "PlaceHolder", isFilled: false)
            .previewLayout(.sizeThatFits)
    }
}

func getImage(isFill: Bool, fillKey: String) -> Image
{
    if (isFill == true)
    {
        return Image( systemName: "checkmark.circle.fill")
    }
    else
    {
        return Image( systemName: "checkmark.circle")
    }
}
