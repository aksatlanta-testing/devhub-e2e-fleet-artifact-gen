
{{- define "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.fullname" -}}
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


{{- define "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.labels" -}}
helm.sh/chart: {{ include "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.chart" . }}
{{ include "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo005c989f-2992-4d10-9c0e-93a80118ef11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}