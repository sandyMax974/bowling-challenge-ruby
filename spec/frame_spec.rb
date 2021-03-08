# require 'frame'

# describe Frame do

#     it 'knows how many pins are in one frame' do
#         expect(subject.pins).to eq 10
#     end
#     it 'knows how many pins remain standing' do
#         subject.add(6)
#         expect(subject.remaining_pins).to eq 4
#     end
#     it 'knows what was rolled' do
#         subject.add(3)
#         subject.add(3)
#         expect(subject.rolls.sum).to eq 6 
#     end

#     describe '#score' do
#         it 'return the current frame score' do
#             expect(subject.score).to eq 0
#         end
#     end 

#     describe '#add' do
#         it 'adds throws to the frame - example 1' do
#             subject.add(3)
#             subject.add(5)
#             expect(subject.score).to eq 8
#         end
#         it 'adds throws to the frame - example 2' do
#             subject.add(5)
#             subject.add(4)
#             expect(subject.score).to eq 9
#         end
#     end

#     describe 'completed?' do
#         it 'knows when the frame has been fully played' do
#             subject.add(3)
#             subject.add(5)
#             expect(subject.completed?).to be true
#         end
#         it 'knows when the frame has been fully played' do
#             subject.add(3)
#             expect(subject.completed?).to be false
#         end
#         it 'knows when the frame has been fully played' do
#             subject.add(10)
#             expect(subject.completed?).to be true
#         end
#     end

#     describe '#strike' do
#         it 'knows when a roll is a strike' do
#             subject.add(10)
#             expect(subject.strike?).to be true
#         end
#         it 'knows when a roll is a strike' do
#             subject.add(6)
#             expect(subject.strike?).to be false
#         end
#         it 'knows when a roll is a strike' do
#             subject.add(3)
#             subject.add(6)
#             expect(subject.strike?).to be false
#         end
#     end

#     describe 'spare?' do
#         it 'knows whe a roll is a spare' do
#             subject.add(10)
#             expect(subject.spare?).to be false
#         end 
#         it 'knows whe a roll is a spare' do
#             subject.add(3)
#             subject.add(3)
#             expect(subject.spare?).to be false
#         end 
#         it 'knows whe a roll is a spare' do
#             subject.add(3)
#             subject.add(7)
#             expect(subject.spare?).to be true
#         end 
#     end

#     describe 'input_throw' do
#         it 'ask for user input and add it to the frame' do
#             expect(subject).to receive(:add).with(1)
#             subject.input_throw
#             # expect(subject.rolls).to_not be_empty
#         end
#     end
# end 