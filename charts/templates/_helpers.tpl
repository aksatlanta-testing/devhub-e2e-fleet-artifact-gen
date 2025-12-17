
{{- define "go-echob486d355-2837-4b87-9143-b9aff0609c05.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob486d355-2837-4b87-9143-b9aff0609c05.fullname" -}}
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


{{- define "go-echob486d355-2837-4b87-9143-b9aff0609c05.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob486d355-2837-4b87-9143-b9aff0609c05.labels" -}}
helm.sh/chart: {{ include "go-echob486d355-2837-4b87-9143-b9aff0609c05.chart" . }}
{{ include "go-echob486d355-2837-4b87-9143-b9aff0609c05.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob486d355-2837-4b87-9143-b9aff0609c05.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob486d355-2837-4b87-9143-b9aff0609c05.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}