import Foundation

class SettingsRepository{
        
    func retrieve(completion: (data: Settings)->()){

        let url = NSURL(string: "http://r.pnd.se/getsettings")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            // let parsedData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            let encodedData = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            
            completion(data: Settings(data: encodedData))
        }

        task.resume()
    }
    
}