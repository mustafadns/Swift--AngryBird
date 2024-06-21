//
//  GameScene.swift
//  AngryBirdsClone
//
//  Created by Mustafa DANIŞAN on 5.06.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // var bird2 = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }
    
    override func didMove(to view: SKView) {
        
        // Kullanıcı arayüzünü bu şekilde tasarlıyoruz ancak kolaylık olsun diye GameScene'yi kullandık ...
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
        bird2.zPosition = 1
        self.addChild(bird2)
        */
        
        // Telefon sınırları dışına çıkmaması için
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .fill
        self.physicsWorld.contactDelegate = self
        
        //KUŞ
        
        // UI'ı tanımlana kuş
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        // Kuşun kendisinin tanımlaması
        let birdTexture = SKTexture(imageNamed: "bird")
        
        // Kuş'un fiziksel olarak yarıçap tanımlaması
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().width / 16)
        
        // Kuş gerçekten yer çekiminden etkilenecek mi
        bird.physicsBody?.affectedByGravity = false
        
        // Kuş fiziksel simülasyonlardan etkilenecek mi
        bird.physicsBody?.isDynamic = true
        
        // Kuş'un kütlesi
        bird.physicsBody?.mass = 0.15
        
        // Kuş'un orijinal pozisyonu
        originalPosition = bird.position
        
        // Çarpışma olayında objelerin birbirisini algılaması için yazılmış kod
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        // BOX
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 6, height: boxTexture.size().height / 6)
        
        // Kutu'nun kendsinin tanımlanması
        box1 = childNode(withName: "box1") as! SKSpriteNode
        
        // Kutu'nun fiziksel olarak uzunlıuk tanımlaması
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        // Kutu fiziksel simülasyondan etkilenecek mi
        box1.physicsBody?.isDynamic = true
        
        // Kutu'nu yer çekiminden etkilenecek mi
        box1.physicsBody?.affectedByGravity = true
        
        // Çarpma sonrası kutular sağa sola dönebilir mi
        box1.physicsBody?.allowsRotation = true
        
        // Kutu'nun kütlesi
        box1.physicsBody?.mass = 0.4
        
        // Çarpışma olayında kutunun brd'i tanıması için
        box1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        // Kutu'nun kendsinin tanımlanması
        box2 = childNode(withName: "box2") as! SKSpriteNode
        
        // Kutu'nun fiziksel olarak uzunlıuk tanımlaması
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        // Kutu fiziksel simülasyondan etkilenecek mi
        box2.physicsBody?.isDynamic = true
        
        // Kutu'nu yer çekiminden etkilenecek mi
        box2.physicsBody?.affectedByGravity = true
        
        // Çarpma sonrası kutular sağa sola dönebilir mi
        box2.physicsBody?.allowsRotation = true
        
        // Kutu'nun kütlesi
        box2.physicsBody?.mass = 0.4
        
        // Çarpışma olayında kutunun brd'i tanıması için
        box2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        // Kutu'nun kendsinin tanımlanması
        box3 = childNode(withName: "box3") as! SKSpriteNode
        
        // Kutu'nun fiziksel olarak uzunlıuk tanımlaması
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        // Kutu fiziksel simülasyondan etkilenecek mi
        box3.physicsBody?.isDynamic = true
        
        // Kutu'nu yer çekiminden etkilenecek mi
        box3.physicsBody?.affectedByGravity = true
        
        // Çarpma sonrası kutular sağa sola dönebilir mi
        box3.physicsBody?.allowsRotation = true
        
        // Kutu'nun kütlesi
        box3.physicsBody?.mass = 0.4
        
        // Çarpışma olayında kutunun brd'i tanıması için
        box3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        // Kutu'nun kendsinin tanımlanması
        box4 = childNode(withName: "box4") as! SKSpriteNode
        
        // Kutu'nun fiziksel olarak uzunlıuk tanımlaması
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        // Kutu fiziksel simülasyondan etkilenecek mi
        box4.physicsBody?.isDynamic = true
        
        // Kutu'nu yer çekiminden etkilenecek mi
        box4.physicsBody?.affectedByGravity = true
        
        // Çarpma sonrası kutular sağa sola dönebilir mi
        box4.physicsBody?.allowsRotation = true
        
        // Kutu'nun kütlesi
        box4.physicsBody?.mass = 0.4
        
        // Çarpışma olayında kutunun brd'i tanıması için
        box4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        // Kutu'nun kendsinin tanımlanması
        box5 = childNode(withName: "box5") as! SKSpriteNode
        
        // Kutu'nun fiziksel olarak uzunlıuk tanımlaması
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        // Kutu fiziksel simülasyondan etkilenecek mi
        box5.physicsBody?.isDynamic = true
        
        // Kutu'nu yer çekiminden etkilenecek mi
        box5.physicsBody?.affectedByGravity = true
        
        // Çarpma sonrası kutular sağa sola dönebilir mi
        box5.physicsBody?.allowsRotation = true
        
        // Kutu'nun kütlesi
        box5.physicsBody?.mass = 0.4
        
        // Çarpışma olayında kutunun brd'i tanıması için
        box5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        // LABEL
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 80
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 3)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {
            score += 1
            scoreLabel.text = String(score)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    // Kullanıcı ekrana dokunmaya başladı
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Kullanıcı elini oynattı
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Kullanıcı dokunmayı bitirdi
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Kullanıcı dokunmaktan vazgeçti
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0.1 && 
                birdPhysicsBody.velocity.dy <= 0.1 &&
                birdPhysicsBody.angularVelocity <= 0.1 &&
                gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                gameStarted = false
                
                score = 0
                scoreLabel.text = String(score)
            }
        }
    }
}
