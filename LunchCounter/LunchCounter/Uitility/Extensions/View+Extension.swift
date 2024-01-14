//
//  View+Extension.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
      self.modifier(ToastModifier(toast: toast))
    }
}
