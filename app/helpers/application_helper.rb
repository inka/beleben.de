# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
      #========================================
  # lorem
  #========================================

  def lorem(word_count = 20)

    #===== words
    words =<<EOS
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer in
mi a mauris ornare sagittis. Suspendisse potenti. Suspendisse dapibus
dignissim dolor. Nam sapien tellus, tempus et, tempus ac, tincidunt
in, arcu. Duis dictum. Proin magna nulla, pellentesque non, commodo
et, iaculis sit amet, mi. Mauris condimentum massa ut metus. Donec
viverra, sapien mattis rutrum tristique, lacus eros semper tellus, et
molestie nisi sapien eu massa. Vestibulum ante ipsum primis in
faucibus orci luctus et ultrices posuere cubilia Curae; Fusce erat
tortor, mollis ut, accumsan ut, lacinia gravida, libero. Curabitur
massa felis, accumsan feugiat, convallis sit amet, porta vel, neque.
Duis et ligula non elit ultricies rutrum. Suspendisse tempor.
Quisque posuere malesuada velit. Sed pellentesque mi a purus. Integer
imperdiet, orci a eleifend mollis, velit nulla iaculis arcu, eu rutrum
magna quam sed elit. Nullam egestas. Integer interdum purus nec
mauris. Vestibulum ac mi in nunc suscipit dapibus. Duis consectetuer,
ipsum et pharetra sollicitudin, metus turpis facilisis magna, vitae
dictum ligula nulla nec mi. Nunc ante urna, gravida sit amet, congue
et, accumsan vitae, magna. Praesent luctus. Nullam in velit. Praesent
est. Curabitur turpis.
Class aptent taciti sociosqu ad litora torquent per conubia nostra,
per inceptos hymenaeos. Cras consectetuer, nibh in lacinia ornare,
turpis sem tempor massa, sagittis feugiat mauris nibh non tellus.
Phasellus mi. Fusce enim. Mauris ultrices, turpis eu adipiscing
viverra, justo libero ullamcorper massa, id ultrices velit est quis
tortor. Quisque condimentum, lacus volutpat nonummy accumsan, est nunc
imperdiet magna, vulputate aliquet nisi risus at est. Aliquam
imperdiet gravida tortor. Praesent interdum accumsan ante. Vivamus est
ligula, consequat sed, pulvinar eu, consequat vitae, eros. Nulla elit
nunc, congue eget, scelerisque a, tempor ac, nisi. Morbi facilisis.
Pellentesque habitant morbi tristique senectus et netus et malesuada
fames ac turpis egestas. In hac habitasse platea dictumst. Suspendisse
vel lorem ut ligula tempor consequat. Quisque consectetuer nisl eget
elit.
Proin quis mauris ac orci accumsan suscipit. Sed ipsum. Sed vel libero
nec elit feugiat blandit. Vestibulum purus nulla, accumsan et,
volutpat at, pellentesque vel, urna. Suspendisse nonummy. Aliquam
pulvinar libero. Donec vulputate, orci ornare bibendum condimentum,
lorem elit dignissim sapien, ut aliquam nibh augue in turpis.
Phasellus ac eros. Praesent luctus, lorem a mollis lacinia, leo turpis
commodo sem, in lacinia mi quam et quam. Curabitur a libero vel tellus
mattis imperdiet. In congue, neque ut scelerisque bibendum, libero
lacus ullamcorper sapien, quis aliquet massa velit vel orci. Fusce in
nulla quis est cursus gravida. In nibh. Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Integer fermentum pretium massa. Morbi
feugiat iaculis nunc.
Aenean aliquam pretium orci. Cum sociis natoque penatibus et magnis
dis parturient montes, nascetur ridiculus mus. Vivamus quis tellus vel
quam varius bibendum. Fusce est metus, feugiat at, porttitor et,
cursus quis, pede. Nam ut augue. Nulla posuere. Phasellus at dolor a
enim cursus vestibulum. Duis id nisi. Duis semper tellus ac nulla.
Vestibulum scelerisque lobortis dolor. Aenean a felis. Aliquam erat
volutpat. Donec a magna vitae pede sagittis lacinia. Cras vestibulum
diam ut arcu. Mauris a nunc. Duis sollicitudin erat sit amet turpis.
Proin at libero eu diam lobortis fermentum. Nunc lorem turpis,
imperdiet id, gravida eget, aliquet sed, purus. Ut vehicula laoreet
ante.
Mauris eu nunc. Sed sit amet elit nec ipsum aliquam egestas. Donec non
nibh. Cras sodales pretium massa. Praesent hendrerit est et risus.
Vivamus eget pede. Curabitur tristique scelerisque dui. Nullam
ullamcorper. Vivamus venenatis velit eget enim. Nunc eu nunc eget
felis malesuada fermentum. Quisque magna. Mauris ligula felis, luctus
a, aliquet nec, vulputate eget, magna. Quisque placerat diam sed arcu.
Praesent sollicitudin. Aliquam non sapien. Quisque id augue. Class
aptent taciti sociosqu ad litora torquent per conubia nostra, per
inceptos hymenaeos. Etiam lacus lectus, mollis quis, mattis nec,
commodo facilisis, nibh. Sed sodales sapien ac ante. Duis eget lectus
in nibh lacinia auctor.
Fusce interdum lectus non dui. Integer accumsan. Quisque quam.
Curabitur scelerisque imperdiet nisl. Suspendisse potenti. Nam massa
leo, iaculis sed, accumsan id, ultrices nec, velit. Suspendisse
potenti. Mauris bibendum, turpis ac viverra sollicitudin, metus massa
interdum orci, non imperdiet orci ante at ipsum. Etiam eget magna.
Mauris at tortor eu lectus tempor tincidunt. Phasellus justo purus,
pharetra ut, ultricies nec, consequat vel, nisi. Fusce vitae velit at
libero sollicitudin sodales. Aenean mi libero, ultrices id, suscipit
vitae, dapibus eu, metus. Aenean vestibulum nibh ac massa. Vivamus
vestibulum libero vitae purus. In hac habitasse platea dictumst.
Curabitur blandit nunc non arcu.
Ut nec nibh. Morbi quis leo vel magna commodo rhoncus. Donec congue
leo eu lacus. Pellentesque at erat id mi consequat congue. Praesent a
nisl ut diam interdum molestie. Fusce suscipit rhoncus sem. Donec
pretium. Aliquam molestie. Vivamus et justo at augue aliquet dapibus.
Pellentesque felis.
Morbi semper. In venenatis imperdiet neque. Donec auctor molestie
augue. Nulla id arcu sit amet dui lacinia convallis. Proin tincidunt.
Proin a ante. Nunc imperdiet augue. Nullam sit amet arcu. Quisque
laoreet viverra felis. Lorem ipsum dolor sit amet, consectetuer
adipiscing elit. In hac habitasse platea dictumst. Pellentesque
habitant morbi tristique senectus et netus et malesuada fames ac
turpis egestas. Class aptent taciti sociosqu ad litora torquent per
conubia nostra, per inceptos hymenaeos. Nullam nibh sapien, volutpat
ut, placerat quis, ornare at, lorem. Class aptent taciti sociosqu ad
litora torquent per conubia nostra, per inceptos hymenaeos.
Morbi dictum massa id libero. Ut neque. Phasellus tincidunt, nibh ut
tincidunt lacinia, lacus nulla aliquam mi, a interdum dui augue non
pede. Duis nunc magna, vulputate a, porta at, tincidunt a, nulla.
Praesent facilisis. Suspendisse sodales feugiat purus. Cras et justo a
mauris mollis imperdiet. Morbi erat mi, ultrices eget, aliquam
elementum, iaculis id, velit. In scelerisque enim sit amet turpis. Sed
aliquam, odio nonummy ullamcorper mollis, lacus nibh tempor dolor, sit
amet varius sem neque ac dui. Nunc et est eu massa eleifend mollis.
Mauris aliquet orci quis tellus. Ut mattis.
Praesent mollis consectetuer quam. Nulla nulla. Nunc accumsan, nunc
sit amet scelerisque porttitor, nibh pede lacinia justo, tristique
mattis purus eros non velit. Aenean sagittis commodo erat. Aliquam id
lacus. Morbi vulputate vestibulum elit.
EOS
    words.gsub!(/\n/,' ')
    words.gsub!(/\./,' ')
    words.gsub!(/\,/,' ')
    words.gsub!(/  */,' ')
    words.strip!
    words.downcase!
    words = words.split(/ /)

    #===== lorem
    lorem = ""
    #0.upto(word_count) {|n| lorem << words[rand(words.length)]}

    #===== total
    twn = 0
    twc = word_count
    while twn < twc

      #===== paragraph
      pwn = 0
      pwc = rand(100)+200
      while pwn < pwc and twn < twc do

        #===== sentence
        swn = 0
        swc = rand(10)+3
        while swn < swc and pwn < pwc and twn < twc do

          word = words[rand(words.length)]
          if swn == 0
            lorem << "#{word.capitalize} "
          else
            lorem << "#{word} "
          end

          twn +=1
          pwn +=1
          swn +=1

        end
        lorem << ". "

      end
      lorem << "\n\n"

    end

    lorem = lorem.gsub!(/ \./,'.')

  end
end
