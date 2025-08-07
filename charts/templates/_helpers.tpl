
{{- define "go-echo8d299247-1853-456b-836b-1c334cf8b445.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d299247-1853-456b-836b-1c334cf8b445.fullname" -}}
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


{{- define "go-echo8d299247-1853-456b-836b-1c334cf8b445.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d299247-1853-456b-836b-1c334cf8b445.labels" -}}
helm.sh/chart: {{ include "go-echo8d299247-1853-456b-836b-1c334cf8b445.chart" . }}
{{ include "go-echo8d299247-1853-456b-836b-1c334cf8b445.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d299247-1853-456b-836b-1c334cf8b445.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d299247-1853-456b-836b-1c334cf8b445.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}