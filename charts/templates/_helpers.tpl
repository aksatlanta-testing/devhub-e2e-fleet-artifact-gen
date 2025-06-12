
{{- define "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.fullname" -}}
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


{{- define "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.labels" -}}
helm.sh/chart: {{ include "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.chart" . }}
{{ include "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcb8c1a8-8699-4be1-a1b1-75c5d3f32ce7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}