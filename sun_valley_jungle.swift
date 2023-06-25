import UIKit

// MARK:- Small Business Consulting Service 

class SmallBusinessConsultingService {

    // MARK:- Properties

    var clients: [SmallBusiness] = []

    // MARK:- Initializers

    init() {}

    // MARK:- Functions

    /// This function adds a new client to the consulting service.
    /// - Parameter business: The small business object that will be consulting with the service.
    func addClient(business: SmallBusiness) {
        clients.append(business)
    }

    /// This function processes the projects for the consulting service.
    /// - Parameter project: The project that needs to be processed by the consulting service.
    func processProject(project: SmallBusinessProject) {
        for client in clients {
            if project.clientId == client.id {
                project.process()
            }
        }
    }
}

// MARK:- Small Business

class SmallBusiness {

    // MARK:- Properties

    var id: String
    var name: String
    var projects: [SmallBusinessProject] = []

    // MARK:- Initializers

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    // MARK:- Functions

    /// This function adds a new project to the small business.
    /// - Parameter project: The project that needs to be added to the small business.
    func addProject(project: SmallBusinessProject) {
        projects.append(project)
    }

    /// This function processes the projects for the small business.
    /// - Parameter project: The project that needs to be processed by the small business.
    func processProject(project: SmallBusinessProject) {
        for project in projects {
            if project.clientId == id {
                project.process()
            }
        }
    }
}

// MARK:- Small Business Project

class SmallBusinessProject {

    // MARK:- Properties

    var clientId: String
    var name: String
    var status: ProjectStatus

    // MARK:- Initializers

    init(clientId: String, name: String, status: ProjectStatus) {
        self.clientId = clientId
        self.name = name
        self.status = status
    }

    // MARK:- Functions

    /// This function processes the project.
    func process() {
        switch status {
        case .inProgress:
            print("Project is currently in progress")
        case .completed:
            print("Project is completed")
        case .delayed:
            print("Project is delayed.")
        }
    }
}

// MARK:- Enums

enum ProjectStatus {
    case inProgress
    case completed
    case delayed
}