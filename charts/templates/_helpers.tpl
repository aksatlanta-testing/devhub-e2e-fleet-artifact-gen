
{{- define "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.fullname" -}}
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


{{- define "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.labels" -}}
helm.sh/chart: {{ include "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.chart" . }}
{{ include "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b782fc7-2d6c-4274-8694-c7cc94c29087.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}