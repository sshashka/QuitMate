//
//  DetectingMoodViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 18.04.2023.
//

import UIKit

final class MoodClassifierViewController: UIViewController, UINavigationControllerDelegate {
    var presenter: MoodClassifierModulePresenterProtocol?
    private let imagePicker: UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.cameraDevice = .front
        return vc
    }()
    
    private let classificationResultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        view.backgroundColor = .brown
        view.addSubview(classificationResultsTableView)
//        classificationResultsTableView.delegate = self
//        classificationResultsTableView.dataSource = self
        
        present(imagePicker, animated: true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MoodClassifierViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        guard let imageData = image.pngData() else { return }
        presenter?.userDidTakePicture(image: imageData)
        imagePicker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true)
    }
}

extension MoodClassifierViewController: MoodClassifierViewControllerProtocol {
    func classifierServiceSentSuccess() {
        print("fuck you")
    }
    
    func showValidationFailureAlert(message: String) {
        print(message)
    }
}
