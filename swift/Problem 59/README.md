## Description

This problem was asked by Google.

Implement a file syncing algorithm for two computers over a low-bandwidth network. What if we know the files in the two computers are mostly the same?

## Solution

An OS is composed of
 
- a directory that keep a reference to its files
- another directory that keep a reference of recently updated files

```swift
struct OS {
    
    var directory: [FileData]
    var addedSinceLastSync: [FileData]
    
    mutating func addFile(file: FileData) {
        directory.append(file)
    }
    
    mutating func deleteFile(file: FileData) {
        for i in 0..<directory.count {
            if directory[i].data == file.data {
                directory[i].deletedAt = Date()
            }
        }
    }
    
    mutating func updateFile(file: FileData) {
        for i in 0..<directory.count {
            if directory[i].data == file.data {
                if file.updatedAt > directory[i].updatedAt {
                    directory[i] = file
                }
            }
        }
    }
}

struct FileData {
    var data: Data
    var updatedAt: Date
    var deletedAt: Date
}
```

The synchronization pushes updates first, then it add recently added files, it get files added remotely and finaly update local file based on the remote repository

```swift
struct Synchronization {
    var localOS: OS
    var remoteOS: OS
    
    mutating func synchronize() {
        for file in localOS.directory {
            remoteOS.updateFile(file: file)
        }
        
        for file in localOS.addedSinceLastSync {
            remoteOS.addFile(file: file)
            localOS.directory.append(file)
        }
        
        localOS.addedSinceLastSync = []
        
        for file in remoteOS.addedSinceLastSync {
            localOS.addFile(file: file)
        }
        
        remoteOS.addedSinceLastSync = []
        
        for file in remoteOS.directory {
            localOS.updateFile(file: file)
        }
    }
}
```