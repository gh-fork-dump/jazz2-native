set(SOURCES
	${NCINE_ROOT}/Shared/Containers/SmallVector.cpp
	${NCINE_ROOT}/Shared/Containers/String.cpp
	${NCINE_ROOT}/Shared/Containers/StringView.cpp
	${NCINE_ROOT}/Shared/Environment.cpp
	${NCINE_ROOT}/Shared/Utf8.cpp
)

list(APPEND SOURCES
	${NCINE_SOURCE_DIR}/nCine/Base/Algorithms.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/BitArray.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/Clock.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/FrameTimer.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/HashFunctions.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/Object.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/Random.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/Timer.cpp
	${NCINE_SOURCE_DIR}/nCine/Base/TimeStamp.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/AnimatedSprite.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/BaseSprite.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Camera.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/DrawableNode.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Geometry.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GfxCapabilities.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLAttribute.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLBlending.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLBufferObject.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLClearColor.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLCullFace.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLDebug.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLDepthTest.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLFramebuffer.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLRenderbuffer.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLScissorTest.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLShader.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLShaderProgram.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLShaderUniformBlocks.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLShaderUniforms.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLTexture.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLUniform.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLUniformBlock.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLUniformBlockCache.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLUniformCache.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLVertexArrayObject.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLVertexFormat.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/GL/GLViewport.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/IGfxDevice.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ITextureLoader.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Material.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/MeshSprite.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Particle.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ParticleAffectors.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ParticleInitializer.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ParticleSystem.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RectAnimation.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderBatcher.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderBuffersManager.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderCommand.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderCommandPool.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderQueue.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderResources.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderStatistics.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/RenderVaoPool.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/SceneNode.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ScreenViewport.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Shader.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/ShaderState.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Sprite.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Texture.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureFormat.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderDds.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderKtx.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderPvr.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderRaw.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderPng.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/TextureLoaderQoi.cpp
	${NCINE_SOURCE_DIR}/nCine/Graphics/Viewport.cpp
	${NCINE_SOURCE_DIR}/nCine/Input/IInputManager.cpp
	${NCINE_SOURCE_DIR}/nCine/Input/JoyMapping.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/CompressionUtils.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/FileSystem.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/GrowableMemoryFile.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/IFileStream.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/MemoryFile.cpp
	${NCINE_SOURCE_DIR}/nCine/IO/StandardFile.cpp
	${NCINE_SOURCE_DIR}/nCine/Primitives/Color.cpp
	${NCINE_SOURCE_DIR}/nCine/Primitives/Colorf.cpp
	${NCINE_SOURCE_DIR}/nCine/AppConfiguration.cpp
	${NCINE_SOURCE_DIR}/nCine/Application.cpp
	${NCINE_SOURCE_DIR}/nCine/ArrayIndexer.cpp
	${NCINE_SOURCE_DIR}/nCine/ServiceLocator.cpp
#	${NCINE_SOURCE_DIR}/nCine/Base/CString.cpp
#	${NCINE_SOURCE_DIR}/nCine/Base/String.cpp
#	${NCINE_SOURCE_DIR}/nCine/Base/Utf8.cpp
#	${NCINE_SOURCE_DIR}/nCine/FileLogger.cpp
#	${NCINE_SOURCE_DIR}/nCine/FntParser.cpp
#	${NCINE_SOURCE_DIR}/nCine/Font.cpp
#	${NCINE_SOURCE_DIR}/nCine/FontGlyph.cpp
#	${NCINE_SOURCE_DIR}/nCine/Graphics/ITextureSaver.cpp
#	${NCINE_SOURCE_DIR}/nCine/Graphics/TextNode.cpp
)

list(APPEND SOURCES
	${NCINE_SOURCE_DIR}/Main.cpp
	${NCINE_SOURCE_DIR}/Jazz2/ContentResolver.cpp
	${NCINE_SOURCE_DIR}/Jazz2/LevelHandler.cpp
	${NCINE_SOURCE_DIR}/Jazz2/PreferencesCache.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/ActorBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Player.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/PlayerCorpse.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/SolidObjectBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/AmmoCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/CarrotCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/CarrotFlyCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/CarrotInvincibleCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/CoinCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/CollectibleBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/FastFireCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/FoodCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/GemCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/GemGiant.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/GemRing.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/OneUpCollectible.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Collectibles/Stopwatch.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bat.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bee.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Caterpillar.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Crab.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Demon.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Doggy.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Dragon.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Dragonfly.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/FatChick.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Fencer.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Fish.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/EnemyBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Helmut.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/LabRat.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Lizard.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/LizardFloat.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/MadderHatter.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Monkey.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Rapier.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Raven.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Skeleton.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Sparks.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Sucker.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/SuckerFloat.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Turtle.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/TurtleShell.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/TurtleTough.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/TurtleTube.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Witch.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bosses/BossBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bosses/Bilsy.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bosses/Bubba.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bosses/Queen.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Enemies/Bosses/TurtleBoss.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/AirboardGenerator.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/AmbientBubbles.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/AmbientSound.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Bird.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/BirdCage.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Bomb.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/BonusWarp.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Checkpoint.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Copter.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/EndOfLevel.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Eva.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Moth.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/Spring.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Environment/SteamNote.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Explosion.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Lighting/FlickerLight.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Lighting/PulsatingRadialLight.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Lighting/StaticRadialLight.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/AmmoBarrel.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/AmmoCrate.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/BarrelContainer.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/Bridge.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/CrateContainer.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/GenericContainer.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/GemBarrel.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/GemCrate.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/MovingPlatform.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PinballBumper.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PinballPaddle.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/Pole.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PowerUpMorphMonitor.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PowerUpShieldMonitor.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PowerUpWeaponMonitor.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/PushableBox.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/SpikeBall.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Solid/TriggerCrate.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/BlasterShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/BouncerShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/ElectroShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/FreezerShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/PepperShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/RFShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/SeekerShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/ShotBase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/Thunderbolt.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/ToasterShot.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Actors/Weapons/TNT.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Collisions/DynamicTree.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Collisions/DynamicTreeBroadPhase.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/AnimSetMapping.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/EventConverter.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Anims.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Block.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Episode.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Level.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Strings.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Text.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Compatibility/JJ2Tileset.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Events/EventMap.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Events/EventSpawner.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/LevelScripts.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/RegisterArray.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/RegisterRef.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/RegisterString.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/ScriptActorWrapper.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Scripting/ScriptPlayerWrapper.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Tiles/TileMap.cpp
	${NCINE_SOURCE_DIR}/Jazz2/Tiles/TileSet.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Canvas.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Cinematics.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/ControlScheme.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Font.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/HUD.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/RgbLights.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/UpscaleRenderPass.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/AboutSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/BeginSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/ControlsOptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/EpisodeSelectSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/GameplayEnhancementsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/GameplayOptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/GraphicsOptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/ImportSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/InGameMenu.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/MainMenu.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/OptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/PauseSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/RemapControlsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/RescaleModeSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/SoundsOptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/StartGameOptionsSection.cpp
	${NCINE_SOURCE_DIR}/Jazz2/UI/Menu/TouchControlsOptionsSection.cpp
)