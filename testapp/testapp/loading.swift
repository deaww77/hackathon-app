//
//  loading.swift
//  testapp
//
//  Created by admin on 30/8/24.
//

import SwiftUI

struct loading: View {
    @State private var isActive: Bool = false

    var body: some View {
        VStack {
            if isActive {
                // แสดงหน้า LoginView เมื่อเวลาผ่านไป 2 วินาที
                LoginView()
            } else {
                // หน้าจอโหลด
                VStack {
                    Text("Loading...")
                        .font(.largeTitle)
                        .padding()
                    
                    // สามารถเพิ่มภาพโลโก้หรือแอนิเมชันที่นี่
                    Image("nok")
                        .font(.system(size: 100))
                        .foregroundColor(.blue)
                }
                .onAppear {
                    // ตั้งเวลา 2 วินาที แล้วเปลี่ยนไปที่หน้า LoginView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

