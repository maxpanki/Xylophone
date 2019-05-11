
import UIKit
import AVFoundation

class ViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var player: AVAudioPlayer?

    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(soundName: "note\(sender.tag)", soundExtension: "wav")
        
    }
    
    func playSound(soundName: String, soundExtension: String) {
        
        guard let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "\(soundExtension)")
            else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
  

}

