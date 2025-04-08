
{{- define "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.fullname" -}}
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


{{- define "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.labels" -}}
helm.sh/chart: {{ include "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.chart" . }}
{{ include "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo33e4a5ca-5086-4f1f-af50-5391bbeef21b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}