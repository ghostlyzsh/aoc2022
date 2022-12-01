class Main {
    static public function main():Void {
        var input:String = sys.io.File.getContent('input.txt');

        var elfSplitter = ~/\n\n/g;

        var elfs = elfSplitter.split(input);

        var calSplitter = ~/\n/g;

        var highest = 0;
        var sums = [];
        for(elf in elfs) {
            var calorieList = calSplitter.split(elf);
            var sum = 0;
            for(calorie in calorieList) {
                var num = Std.parseInt(calorie);
                if(num != null) {
                    sum += num;
                }
            }

            sums.push(sum);
        }
        sums.sort((a, b) -> a - b);
        sums.reverse();

        trace(sums[0] + sums[1] + sums[2]);
    }
}
