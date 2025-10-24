
{{- define "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.fullname" -}}
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


{{- define "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.labels" -}}
helm.sh/chart: {{ include "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.chart" . }}
{{ include "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6b55c1a0-3aac-4ca2-a0a2-b10816ef3911.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}