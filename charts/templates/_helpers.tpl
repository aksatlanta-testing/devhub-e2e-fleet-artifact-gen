
{{- define "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.fullname" -}}
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


{{- define "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.labels" -}}
helm.sh/chart: {{ include "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.chart" . }}
{{ include "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo33882df3-07f5-4f1d-8636-a52aec3981bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}