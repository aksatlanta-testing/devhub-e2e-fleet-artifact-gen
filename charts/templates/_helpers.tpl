
{{- define "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.fullname" -}}
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


{{- define "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.labels" -}}
helm.sh/chart: {{ include "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.chart" . }}
{{ include "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo33e92914-a3c6-4b4c-b501-a1a9c8f6dcce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}