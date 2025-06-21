
{{- define "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.fullname" -}}
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


{{- define "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.labels" -}}
helm.sh/chart: {{ include "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.chart" . }}
{{ include "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc83db25-1bc9-4612-8d23-e508fd3d9b8b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}