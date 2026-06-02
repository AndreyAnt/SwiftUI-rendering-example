import SwiftUI

struct ComputedSubviewDemo: View {
  @State private var parentCount = 0
  @State private var showsSpottingTip = false

  private let animal = Animal.sample

  var body: some View {
    let _ = Self._printChanges()

    DemoScaffold(
      title: "Computed private vars",
      subtitle: "Incrementing the parent counter re-evaluates every private computed subview below.",
      count: parentCount,
      increment: { parentCount += 1 }
    ) {
      habitatSection
      spottingTipSection
      staticSection
    }
  }

  @ViewBuilder
  private var habitatSection: some View {
    let _ = Diagnostics.log("ComputedSubviewDemo.habitatSection evaluated")

    if let name = HabitatsProvider.habitatName(for: animal.habitatID) {
      DemoSection(
        title: "Habitat",
        badge: "@ViewBuilder private var",
        systemImage: "leaf"
      ) {
        Text(name)
      }
    }
  }

  private var spottingTipSection: some View {
    Diagnostics.log("ComputedSubviewDemo.spottingTipSection evaluated")

    return DemoSection(
      title: "Parent state dependency",
      badge: "private var",
      systemImage: "eye"
    ) {
      Toggle("Show spotting tip", isOn: $showsSpottingTip)

      if showsSpottingTip {
        Text(animal.howToSpot)
          .foregroundStyle(.secondary)
      }
    }
  }

  private var staticSection: some View {
    Diagnostics.log("ComputedSubviewDemo.staticSection evaluated")

    return DemoSection(
      title: "No dependency",
      badge: "private var",
      systemImage: "circle.dotted"
    ) {
      Text("This section reads no state, environment, or model values.")
        .foregroundStyle(.secondary)
    }
  }
}
