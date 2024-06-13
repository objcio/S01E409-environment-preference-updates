import SwiftUI

// reduce(x, { defaultValue }) => x
// reduce(defaultValue, { x }) => x

struct TestKey: PreferenceKey {
    static let defaultValue = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        let new = nextValue()
        print("Reduce", value, new)
        value = value || new
    }
}

struct ContentView: View {
    @State var foo = false
    var body: some View {
        VStack {
            Color.blue
                .preference(key: TestKey.self, value: true)
            ZStack {
                ForEach(0..<0) { _ in }
            }


        }
        .padding()
        .onPreferenceChange(TestKey.self, perform: { value in
            print("On change: \(value)")
        })
    }
}

#Preview {
    ContentView()
}
