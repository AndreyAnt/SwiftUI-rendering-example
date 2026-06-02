import SwiftUI

struct StandaloneSubviewDemo: View {
  @State private var parentCount = 0
  @State private var showsSpottingTip = false

  private let animal = Animal.sample

  var body: some View {
    let _ = Self._printChanges()

    DemoScaffold(
      title: "Standalone view structs",
      subtitle: "Incrementing the parent counter leaves child view dependencies isolated.",
      count: parentCount,
      increment: { parentCount += 1 }
    ) {
      HabitatSection(animal: animal)
      SpottingTipSection(
        animal: animal,
        showsSpottingTip: $showsSpottingTip
      )
      StaticSection()
    }
  }
}

private struct HabitatSection: View {
  let animal: Animal

  var body: some View {
    let _ = Self._printChanges()
    let _ = Diagnostics.log("HabitatSection.body evaluated")

    if let name = HabitatsProvider.habitatName(for: animal.habitatID) {
      DemoSection(
        title: "Habitat",
        badge: "standalone View",
        systemImage: "leaf"
      ) {
        Text(name)
      }
    }
  }
}

private struct SpottingTipSection: View {
  let animal: Animal
  @Binding var showsSpottingTip: Bool

  var body: some View {
    let _ = Self._printChanges()
    let _ = Diagnostics.log("SpottingTipSection.body evaluated")

    DemoSection(
      title: "Parent state binding",
      badge: "@Binding in child",
      systemImage: "eye"
    ) {
      Toggle("Show spotting tip", isOn: $showsSpottingTip)

      if showsSpottingTip {
        Text(animal.howToSpot)
          .foregroundStyle(.secondary)
      }
    }
  }
}

private struct StaticSection: View {
  var body: some View {
    let _ = Self._printChanges()
    let _ = Diagnostics.log("StaticSection.body evaluated")

    DemoSection(
      title: "No dependency",
      badge: "standalone View",
      systemImage: "circle.dotted"
    ) {
      Text("This section reads no state, environment, or model values.")
        .foregroundStyle(.secondary)
    }
  }
}
