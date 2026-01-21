
{{- define "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.fullname" -}}
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


{{- define "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.labels" -}}
helm.sh/chart: {{ include "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.chart" . }}
{{ include "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1ca132d-c032-4ff4-9b83-58007a29262b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}