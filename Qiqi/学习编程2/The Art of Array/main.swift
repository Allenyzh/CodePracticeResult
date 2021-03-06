let allCoordinates = world.allPossibleCoordinates
let backRow = world.coordinates(inRows: [0])
let insideSquare = world.coordinates(inColumns: [4,5], intersectingRows: [4,6])
let squareCorners = world.coordinates(inColumns: [1,2,3,4,5,6,7,8,9], intersectingRows: [3,9])
let squareLock = PlatformLock(color: .green)
world.place(squareLock, at: Coordinate(column: 1, row: 1))
let cornerLock = PlatformLock(color: .pink)
world.place(cornerLock, at: Coordinate(column: 8, row: 1))
let backLock = PlatformLock(color: .blue)
world.place(backLock, at: Coordinate(column: 4, row: 1))
for coor in insideSquare {
    world.place(Platform(onLevel: 4, controlledBy: squareLock), at: coor)
    world.place(Character(name: .hopper), at: coor)
}
for coor in squareCorners {
    world.place(Platform(onLevel: 4, controlledBy: cornerLock), at: coor)
    world.place(Expert(), at: coor)
}
for coor in backRow {
    world.place(Platform(onLevel: 2, controlledBy: backLock), at: Coordinate(column: coor.column, row: coor.row + 1))
    world.place(Character(name: .blu), facing: north, at: coor)
}
let blus = world.existingCharacters(at: backRow)
let hoppers = world.existingCharacters(at: insideSquare)
let experts = world.existingExperts(at: squareCorners)
squareLock.movePlatforms(up: true, numberOfTimes: 3)
for hopper in hoppers {
    hopper.turnUp()
}
cornerLock.movePlatforms(up: true, numberOfTimes: 7)
for expert in experts {
    expert.turnUp()
}
for blu in blus {
    blu.jump()
}
backLock.movePlatforms(up: true, numberOfTimes: 13)
for blu in blus {
    blu.turnLeft()
    blu.turnLeft()
    blu.turnUp()
}
