import SwiftUI

struct DemoScaffold<Content: View>: View {
  var title: String
  var subtitle: String
  var count: Int
  var increment: () -> Void
  @ViewBuilder var content: Content

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        VStack(alignment: .leading, spacing: 10) {
          Text(title)
            .font(.title2.bold())

          Text(subtitle)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .fixedSize(horizontal: false, vertical: true)
        }

        HStack(spacing: 12) {
          VStack(alignment: .leading, spacing: 4) {
            Text("Parent counter")
              .font(.subheadline)
              .foregroundStyle(.secondary)

            Text(count, format: .number)
              .font(.system(.largeTitle, design: .rounded, weight: .bold))
              .monospacedDigit()
          }

          Spacer()

          Button(action: increment) {
            Label("Increment", systemImage: "plus")
              .font(.headline)
          }
          .buttonStyle(.borderedProminent)
          .controlSize(.large)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 8))

        VStack(alignment: .leading, spacing: 12) {
          content
        }
      }
      .padding()
    }
  }
}

struct DemoSection<Content: View>: View {
  var title: String
  var badge: String
  var systemImage: String
  @ViewBuilder var content: Content

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(alignment: .firstTextBaseline, spacing: 10) {
        Image(systemName: systemImage)
          .font(.headline)
          .foregroundStyle(.tint)
          .frame(width: 24)

        Text(title)
          .font(.headline)

        Spacer(minLength: 8)

        Text(badge)
          .font(.caption.weight(.semibold))
          .foregroundStyle(.secondary)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(.secondary.opacity(0.12))
          .clipShape(Capsule())
      }

      content
        .font(.body)
        .foregroundStyle(.primary)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.background)
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}
