//
//  ViewController.swift
//  videoMergingTest
//
//  Created by mac on 16/08/2021.
//

import UIKit
import AVKit
import SwiftVideoGenerator
class ViewController: UIViewController {
    private let MissingResourceFiles = "Missing resource files"
    private let MissingImageFiles = "Missing image files"
    private let MissingAudioFiles = "Missing audio files"
    private let MissingVideoFiles = "Missing video files"
    
    private let FnishedMultipleVideoGeneration = "Finished multiple type video generation"
    private let FinishedSingleTypeVideoGeneration = "Finished single type video generation"
    private let FinishedMergingVideos = "Finished merging videos"
    private let FinishReversingVideo = "Finished reversing video"
    private let FinishSplittingVideo = "Finished splitting video"
    private let FinishMergingVideoWithAudio = "Finished merging video with audio"
    
    private let SingleMovieFileName = "singleMovie"
    private let MultipleMovieFileName = "multipleVideo"
    private let MultipleSingleMovieFileName = "newVideo"
    private let MergedMovieFileName = "mergedMovie"
    private let ReversedMovieFileName = "reversedMovie"
    private let SplitMovieFileName = "splitMovie"
    private let NewAudioMovieFileName = "newAudioMovie"
    
    /// Resource extensions
    private let MovExtension = "mov"
    private let Mp3Extension = "mp3"
    private let MOVExtension = "mov"
    private let Mp4Extension = "mp4"
    
    /// Resource file names
    private let Audio1 = "audio1"
    private let Audio2 = "audio2"
    private let Audio3 = "audio3"
    private let Audio4 = "audio4"
    
    private let Video1 = "video1"
    private let Video2 = "video2"
    private let Video3 = "video3"
    private let Video4 = "video4"
    private let PortraitVideo = "portraitVideo"
    
    private let Message = "message"
    private let OK = "OK"
    
    
    fileprivate func createAlertView(message: String?) {
      let messageAlertController = UIAlertController(title: Message, message: message, preferredStyle: .alert)
      messageAlertController.addAction(UIAlertAction(title: OK, style: .default, handler: { (action: UIAlertAction!) in
        messageAlertController.dismiss(animated: true, completion: nil)
      }))
      DispatchQueue.main.async { [weak self] in
        self?.present(messageAlertController, animated: true, completion: nil)
      }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        merg2()
        // Do any additional setup after loading the view.
    }

    func merg(){
        
        //    if let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
        //      if let paths = try? FileManager.default.contentsOfDirectory(atPath: documentsPath) {
        //
        //        var videoURLs: [URL] = []
        //        for path in paths {
        //          videoURLs.append(URL(fileURLWithPath: documentsPath).appendingPathComponent(path))
        //        }
        //
        //        VideoGenerator.mergeMovies(videoURLs: videoURLs, andFileName: MergedMovieFileName, success: { (videoURL) in
        
        if let videoURL1 = Bundle.main.url(forResource: Video1, withExtension: MOVExtension) {
//          LoadingView.lockView()
          VideoGenerator.presetName = AVAssetExportPresetPassthrough
          VideoGenerator.fileName = MergedMovieFileName
          let videUrl22 = URL(string: "https://d4state.s3.ca-central-1.amazonaws.com/F56795B4-4CC6-4DDE-9C3F-7ABC9D5A7CFD.mp4")
            let videUrl11 = URL(string: "https://d4state.s3.ca-central-1.amazonaws.com/F56795B4-4CC6-4DDE-9C3F-7ABC9D5A7CFD.mp4")
          VideoGenerator.mergeMovies(videoURLs: [videUrl11!, videUrl22!]) { (result) in
//            LoadingView.unlockView()
            switch result {
            case .success(let url):
              self.createAlertView(message: self.FinishedMergingVideos)
              print(url)
            case .failure(let error):
              print(error)
              self.createAlertView(message: error.localizedDescription)
            }
          }
        } else {
          self.createAlertView(message: MissingVideoFiles)
        }
      }
    func merg2(){
        VideoGenerator.presetName = AVAssetExportPresetPassthrough
        VideoGenerator.fileName = MergedMovieFileName
        let videUrl22 = URL(string: "https://d4state.s3.ca-central-1.amazonaws.com/F56795B4-4CC6-4DDE-9C3F-7ABC9D5A7CFD.mp4")
          let videUrl11 = URL(string: "https://d4state.s3.ca-central-1.amazonaws.com/F56795B4-4CC6-4DDE-9C3F-7ABC9D5A7CFD.mp4")
        VideoGenerator.mergeMovies(videoURLs: [videUrl11!, videUrl22!]) { (result) in
//            LoadingView.unlockView()
          switch result {
          case .success(let url):
            self.createAlertView(message: self.FinishedMergingVideos)
            print(url)
          case .failure(let error):
            print(error)
            self.createAlertView(message: error.localizedDescription)
          }
        }
    }
}

