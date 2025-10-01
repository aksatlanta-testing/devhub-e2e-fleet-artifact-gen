
{{- define "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.fullname" -}}
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


{{- define "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.labels" -}}
helm.sh/chart: {{ include "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.chart" . }}
{{ include "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2e3db47-ae33-48e8-9075-fb82c80845bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}