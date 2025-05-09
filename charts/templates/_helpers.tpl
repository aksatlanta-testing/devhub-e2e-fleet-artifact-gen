
{{- define "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.fullname" -}}
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


{{- define "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.labels" -}}
helm.sh/chart: {{ include "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.chart" . }}
{{ include "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea2690ae-b9dd-4bb4-a27d-a72bbe5599bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}