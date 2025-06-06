
{{- define "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.fullname" -}}
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


{{- define "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.labels" -}}
helm.sh/chart: {{ include "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.chart" . }}
{{ include "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0e20bd1-cb11-4670-83df-9eeefc727b4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}