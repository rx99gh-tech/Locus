import SwiftUI

struct CustomDurationPickerSheet: View {
    @Environment(\.dismiss) private var dismiss

    @State private var hours: Int = 0
    @State private var minutes: Int = 5
    @State private var seconds: Int = 0
    @State private var errorMessage: String?

    var initialDuration: TimeInterval
    var onSelect: (TimeInterval) -> Void

    init(initialDuration: TimeInterval, onSelect: @escaping (TimeInterval) -> Void) {
        self.initialDuration = initialDuration
        self.onSelect = onSelect

        let totalSeconds = Int(initialDuration)
        let h = totalSeconds / 3600
        let m = (totalSeconds % 3600) / 60
        let s = totalSeconds % 60

        _hours = State(initialValue: min(12, h))
        _minutes = State(initialValue: m)
        _seconds = State(initialValue: s)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("选择时长")
                    .font(.headline)
                    .padding(.top, 16)

                HStack(spacing: 0) {
                    // Hours
                    VStack {
                        Text("小时")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Picker("小时", selection: $hours) {
                            ForEach(0...12, id: \.self) { h in
                                Text("\(h)").tag(h)
                            }
                        }
                        .pickerStyle(.wheel)
                    }

                    // Minutes
                    VStack {
                        Text("分钟")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Picker("分钟", selection: $minutes) {
                            ForEach(0...59, id: \.self) { m in
                                Text("\(m)").tag(m)
                            }
                        }
                        .pickerStyle(.wheel)
                    }

                    // Seconds
                    VStack {
                        Text("秒")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Picker("秒", selection: $seconds) {
                            ForEach(0...59, id: \.self) { s in
                                Text("\(s)").tag(s)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                .frame(height: 180)
                .padding(.horizontal)

                if let errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(LocusTheme.danger)
                        .padding(.horizontal)
                }

                Spacer()

                Button {
                    let totalSec = TimeInterval(hours * 3600 + minutes * 60 + seconds)
                    if totalSec < 5 {
                        errorMessage = "最短时长为 5 秒"
                        return
                    }
                    if totalSec > 43200 {
                        errorMessage = "最长时长为 12 小时"
                        return
                    }

                    onSelect(totalSec)
                    dismiss()
                } label: {
                    Text("设置时长")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Capsule().fill(LocusTheme.accent))
                        .padding(.horizontal, 24)
                }
                .buttonStyle(.plain)
                .padding(.bottom, 24)
            }
            .navigationTitle("自定义时长")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
            }
        }
    }
}
