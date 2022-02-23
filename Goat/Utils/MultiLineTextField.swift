//
//  MultiLineTextField.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

var GRAY_TEXTFIELD_COLOR = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

struct MultiLineTextField: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    var placeholderText: String = "Text View"
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTextField>) -> UITextView {
        let textView = UITextView()
        
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.font = UIFont.systemFont(ofSize: 17)
        
        textView.text = placeholderText
        textView.textColor = .placeholderText
        textView.backgroundColor = .clear

  //      textView.backgroundColor = GRAY_TEXTFIELD_COLOR // set to .clear to have custome textfield
        
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTextField>) {
        
        if text != "" || uiView.textColor == .label {
            uiView.text = text
            
            // Set Text Color & Text Background ---
            uiView.textColor = .black
           
        }
        

        
        
        uiView.delegate = context.coordinator
    }
    
    func frame(numLines: CGFloat) -> some View {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> MultiLineTextField.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiLineTextField
        
        init(_ parent: MultiLineTextField) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placeholderText
                textView.textColor = .placeholderText
            }
        }
    }
}
