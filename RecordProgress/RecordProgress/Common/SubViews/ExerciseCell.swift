//
//  ExerciseCell.swift
//  RecordProgress
//
//  Created by admin on 25.03.2026.
//
import SwiftUI

struct ExerciseView: View {
    let exercise: Exercise
    @State private var needShowSets: Bool = false // Локальное UI состояние, сбрасывается при каждом открытии

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Заголовок упражнения - нажимаемый
            HStack {
                Text(exercise.name)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: needShowSets ? "chevron.up" : "chevron.down")
                    .foregroundColor(.secondary)
            }
            .contentShape(Rectangle()) // Делаем всю область нажимаемой
            .onTapGesture {
                needShowSets.toggle()
            }
            
            // Сеты - показываются/скрываются
            if needShowSets {
                VStack(spacing: 8) {
                    ForEach(exercise.sets) { set in
                        HStack {
                            VStack {
                                Text("Вес")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(set.weight) кг")
                                    .font(.body)
                                    .fontWeight(.medium)
                            }
                            .frame(width: 80, height: 50)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                            
                            VStack {
                                Text("Повторы")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(set.count)")
                                    .font(.body)
                                    .fontWeight(.medium)
                            }
                            .frame(width: 80, height: 50)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)
                            
                            Spacer()
                        }
                    }
                }
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}
