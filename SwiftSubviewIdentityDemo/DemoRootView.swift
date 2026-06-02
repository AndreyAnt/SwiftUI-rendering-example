import SwiftUI

struct DemoRootView: View {
  @State private var mode = DemoMode.computed

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        Picker("Demo mode", selection: $mode) {
          ForEach(DemoMode.allCases) { mode in
            Label(mode.title, systemImage: mode.systemImage)
              .tag(mode)
          }
        }
        .pickerStyle(.segmented)
        .padding([.horizontal, .top])

        Divider()
          .padding(.top, 12)

        switch mode {
        case .computed:
          ComputedSubviewDemo()
        case .standalone:
          StandaloneSubviewDemo()
        }
      }
      .background(.groupedBackground)
      .navigationTitle("Subview Identity")
    }
  }
}

private enum DemoMode: String, CaseIterable, Identifiable {
  case computed
  case standalone

  var id: Self { self }

  var title: String {
    switch self {
    case .computed:
      "Computed"
    case .standalone:
      "Standalone"
    }
  }

  var systemImage: String {
    switch self {
    case .computed:
      "function"
    case .standalone:
      "square.stack.3d.up"
    }
  }
}

private extension ShapeStyle where Self == Color {
  static var groupedBackground: Color {
    Color(uiColor: .systemGroupedBackground)
  }
}
