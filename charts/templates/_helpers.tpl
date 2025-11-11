
{{- define "go-echod214f88b-a639-4355-859a-a09f8576f831.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod214f88b-a639-4355-859a-a09f8576f831.fullname" -}}
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


{{- define "go-echod214f88b-a639-4355-859a-a09f8576f831.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod214f88b-a639-4355-859a-a09f8576f831.labels" -}}
helm.sh/chart: {{ include "go-echod214f88b-a639-4355-859a-a09f8576f831.chart" . }}
{{ include "go-echod214f88b-a639-4355-859a-a09f8576f831.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod214f88b-a639-4355-859a-a09f8576f831.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod214f88b-a639-4355-859a-a09f8576f831.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}