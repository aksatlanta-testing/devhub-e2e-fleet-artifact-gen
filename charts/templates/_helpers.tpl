
{{- define "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.labels" -}}
helm.sh/chart: {{ include "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.chart" . }}
{{ include "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac4d4d5e-e8c3-4bb2-a204-f32bef0c2fbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}