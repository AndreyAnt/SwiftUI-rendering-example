import Foundation

struct Animal: Equatable, Identifiable {
  let id: UUID
  var name: String
  var habitatID: Habitat.ID
  var howToSpot: String

  static let sample = Animal(
    id: UUID(uuidString: "F5C03371-E917-4CC2-B341-186C0B69A2A5")!,
    name: "Red Fox",
    habitatID: Habitat.coastalForestID,
    howToSpot: "Look near tree lines at dawn, especially after light rain."
  )
}

struct Habitat: Equatable, Identifiable {
  let id: UUID
  var name: String

  static let coastalForestID = UUID(uuidString: "8CF1C2F5-BAE6-4EB2-90BA-32B89B8FEA37")!
}

enum HabitatsProvider {
  private static let habitats: [Habitat] = [
    Habitat(id: UUID(uuidString: "9E05B3B8-DB8A-4235-B147-6F083F4E3E4D")!, name: "Alpine Meadow"),
    Habitat(id: UUID(uuidString: "FB013547-5B16-48B4-BDC4-3012765B5FA6")!, name: "Wetland"),
    Habitat(id: Habitat.coastalForestID, name: "Coastal Forest"),
    Habitat(id: UUID(uuidString: "93866856-BB3A-4A0D-845B-6E02986E2FD8")!, name: "Open Grassland"),
    Habitat(id: UUID(uuidString: "153FC62D-E355-4CFD-86D0-B981F6C4F383")!, name: "River Valley")
  ]

  static func habitatName(for habitatID: Habitat.ID) -> String? {
    Diagnostics.log("HabitatsProvider.habitatName(for:) searched")
    return habitats.first { $0.id == habitatID }?.name
  }
}
