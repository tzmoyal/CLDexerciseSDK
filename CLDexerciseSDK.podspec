Pod::Spec.new do |spec|
  spec.name = "CLDexerciseSDK"
  spec.version = "1.0.0"
  spec.summary = "Cloudinary Exercise."
  spec.homepage = "https://github.com/tzmoyal/CLDExerciseSDK"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Tzahi Moyal" => 'tzmoyal@gmail.com' }

  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/tzmoyal/CLDExerciseSDK.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "CLDExerciseSDK/**/*.{h,swift}"

end