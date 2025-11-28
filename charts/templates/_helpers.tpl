
{{- define "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.fullname" -}}
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


{{- define "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.labels" -}}
helm.sh/chart: {{ include "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.chart" . }}
{{ include "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8cc750b-a989-4a6e-b4e0-e84cb48094c5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}