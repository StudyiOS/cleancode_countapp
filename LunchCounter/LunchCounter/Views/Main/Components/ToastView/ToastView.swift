//
//  ToastView.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

struct ToastView: View {
    var toast: Toast
    var onCancelTapped: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: toast.style.iconName)
                .foregroundColor(toast.style.themeColor)
            Text(toast.message)
                .font(Font.caption)
                .foregroundColor(Color(.black))
            
            Spacer(minLength: 10)
            
            Button {
                onCancelTapped()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(size: 14))
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: toast.width)
        .background(.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: .systemGray3), lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
    
}

#Preview {
    ToastView(toast: Toast(style: .success(.chinese), message: "중식 +1")) {
        print("중식 +1")
    }
}
