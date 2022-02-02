
import SwiftUI

struct ContentView: View {
      
    @State var anaPara = 0
    
    
    @State var vadeOranlari: [Int: Double] = [3: 0.14, 6: 0.20, 9: 0.25, 12: 0.50]
    @State var secilenVade = 3
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }()
    var toplamPara: String{
        let faizGetirisi = Double(anaPara) * vadeOranlari[secilenVade]!
        let x = formatter.string(from: NSNumber(value: Double(anaPara) + faizGetirisi)) ?? "$0"
        return x
    }
    

    var body: some View {

        VStack{
                Image("ziraat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .padding()
                Text("Ana Para")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
                
                
                HStack{
             
                    TextField("0.00 TL", value: $anaPara, formatter: formatter)
                            .padding()
                            .frame(height: 60)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .keyboardType(.numberPad)
                        
                   
                    Spacer()
                }
                .padding()
            
            Text("Vade Seçiniz")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.red)
            
            
            Picker("Vade Seçiniz", selection: $secilenVade) {
                ForEach(Array(vadeOranlari.keys.sorted()), id: \.self) { item in
                    Text("\(item)")
                }
            }.pickerStyle(.segmented)
                .padding()
            
            
            Spacer()
            
          
            
          
            Text("\(toplamPara)")
            
             
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
